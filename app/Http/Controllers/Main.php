<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UserDetail;
use App\FinancialDetail;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Main extends Controller
{
    public function index(){
        return 'testing';
    }
    
    public function user_details(Request $request){
        
        $data = $request->input();
        
        $user = new UserDetail;
        $user->company_name   = $data['company_name'];
        $user->sector         = $data['sector'];
        $user->contact_email  = $data['contact_email'];
        $user->contact_person = $data['contact_person'];
        $user->save();
        
        if($user->id){
            return json_encode(array('user_id' => $user->id, 'status' => 'ok'));
        }
    }

    public function financial_details(Request $request){
        $data = $request->input();

        $financial = new FinancialDetail;
        $financial->user_id                     = $data['user_id'];
        $financial->revenue                     = $data['revenue'];
        $financial->years_of_growth             = $data['years_of_growth'];
        $financial->avg_ebitda_last_3_years     = $data['avg_ebitda_last_3_years'];
        $financial->avg_net_result_last_3_years = $data['avg_net_result_last_3_years'];
        $financial->years_with_positive_result  = $data['years_with_positive_result'];
        $financial->net_debt                    = $data['net_debt'];
        $financial->fixed_assets                = $data['fixed_assets'];
        $financial->biggest_shareholder         = $data['biggest_shareholder'];
        $financial->revenue_from_biggest_client = $data['revenue_from_biggest_client'];
        $financial->is_the_company_audited      = $data['is_the_company_audited'];
        $financial->m_and_a_in_the_last_5_years = $data['m_and_a_in_the_last_5_years'];
        $financial->selling_90_percent          = $data['selling_90_percent'];

        $financial->save();

        if($financial->id){
            return json_encode(array('id' => $financial->id, 'status' => 'ok'));
        }
    }

    public function generate($id){
        return $this->validation($id, true);
    }

    public function formula($id){
        return $this->validation($id, false);
    }

    public function send($id){
        $to = "ischanj@yahoo.com";
        $subject = "My subject";
        $txt = "http://localhost:8000/api/generate/" . $id;
        $headers = "From: ischanbebe@gmail.com";

        mail($to,$subject,$txt,$headers);
    }


    public function validation($id, $x){

        $financial = FinancialDetail::where('id', $id)->first();
        
        $spreadsheet = new Spreadsheet();
        $worksheet   = $spreadsheet->getActiveSheet();

        $worksheet->getColumnDimension('A')->setWidth(57);
        $worksheet->getColumnDimension('B')->setWidth(32);
        $worksheet->getColumnDimension('C')->setWidth(25);
        $worksheet->getColumnDimension('D')->setWidth(25);
        $worksheet->getColumnDimension('F')->setWidth(28);
        $worksheet->getColumnDimension('G')->setWidth(25);

        $worksheet->setCellValue('A1', 'Field as shown on the website');
        $worksheet->setCellValue('B1', 'Field');
        $worksheet->setCellValue('C1', 'Value');
        $worksheet->setCellValue('D1', 'Result');

        $worksheet->setCellValue('A2', 'Facturación media de los últimos 3 año (en €):');
        $worksheet->setCellValue('B2', 'Revenue');
        $worksheet->setCellValue('C2', $financial->revenue);
        $worksheet->setCellValue('D2', '=IF(AND(C2>=1500000,C2<=10000000),1,0)');

        $worksheet->setCellValue('A3', 'Años consecutivos creciendo ingreso:');
        $worksheet->setCellValue('B3', 'Years of growth');
        $worksheet->setCellValue('C3', $financial->years_of_growth);
        $worksheet->setCellValue('D3', '=IF(C3>=3,1,0)');

        $worksheet->setCellValue('A4', 'EBITDA media de los últimos 3 años (en €):');
        $worksheet->setCellValue('B4', 'Avg. EBITDA last 3 years');
        $worksheet->setCellValue('C4', $financial->avg_ebitda_last_3_years);
        $worksheet->setCellValue('D4', '=IF(C4>=150000,1,-100)');

        $worksheet->setCellValue('A5', 'Resultado neto medio de los últimos 3 años (en €):');
        $worksheet->setCellValue('B5', 'Avg. net result last 3 years');
        $worksheet->setCellValue('C5', $financial->avg_net_result_last_3_years);
        $worksheet->setCellValue('D5', '=IF(C5>=70000,1,0)');

        $worksheet->setCellValue('A6', 'Años consecutivos con resultado positivo:');
        $worksheet->setCellValue('B6', 'Years with positive net results');
        $worksheet->setCellValue('C6', $financial->years_with_positive_result);
        $worksheet->setCellValue('D6', '=IF(C6>=3,1,0)');

        $worksheet->setCellValue('A7', 'Deuda financiera neta total (en €):');
        $worksheet->setCellValue('B7', 'Net debt');
        $worksheet->setCellValue('C7', $financial->net_debt);
        $worksheet->setCellValue('D7', '=IF(C17<=2,1,IF(C17>3,-100,0))');

        $worksheet->setCellValue('A8', 'Total activo inmovilizado (en €):');
        $worksheet->setCellValue('B8', 'Fixed assets');
        $worksheet->setCellValue('C8', $financial->fixed_assets);
        $worksheet->setCellValue('D8', '=IF(C18<=1.5,1,0)');

        $worksheet->setCellValue('A9', '¿Porcentaje de la empresa del mayor accionista?:');
        $worksheet->setCellValue('B9', '% biggest shareholder');
        $worksheet->setCellValue('C9', $financial->biggest_shareholder . '%');
        $worksheet->setCellValue('D9', '=IF(C9>=65%,1,0)');

        $worksheet->setCellValue('A10', 'Porcentaje de facturación que viene del mayor cliente:');
        $worksheet->setCellValue('B10', '% revenue from biggest client');
        $worksheet->setCellValue('C10', $financial->revenue_from_biggest_client . '%');
        $worksheet->setCellValue('D10', '=IF(C10<=40%,1,0)');

        $worksheet->setCellValue('A11', '¿Ha sido auditada la compañía alguna vez?:');
        $worksheet->setCellValue('B11', 'Is the company audited? (yes/ no)');
        $worksheet->setCellValue('C11', ($financial->is_the_company_audited == 1) ? 'yes' : 'no');
        $worksheet->setCellValue('D11', '=IF(C11="yes",1,0)');

        $worksheet->setCellValue('A12', '¿Operaciones de compra o fusiones en los últimos 5 años?');
        $worksheet->setCellValue('B12', 'm&a in the last 5 years? (yes/ no)');
        $worksheet->setCellValue('C12', ($financial->m_and_a_in_the_last_5_years == 1) ? 'yes' : 'no');
        $worksheet->setCellValue('D12', '=IF(C12="no",1,0)');

        $worksheet->setCellValue('A13', '¿Se quiere vender más del 90% de la compañía?');
        $worksheet->setCellValue('B13', 'Selling 90%? (yes/ no)');
        $worksheet->setCellValue('C13', ($financial->selling_90_percent == 1) ? 'yes' : 'no');
        $worksheet->setCellValue('D13', '=IF(C13="yes",1,-100)');

        $worksheet->mergeCells('A15:A18');

        $style = [
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            ],
        ];

        $worksheet->getStyle('A15:A18')->applyFromArray($style);

        $worksheet->setCellValue('A15', 'Calculated fields (not on the website but important for calculations and "Go" or "No-Go" decisions');
        $worksheet->getStyle('A15')->getAlignment()->setWrapText(true);

        $worksheet->setCellValue('B15', 'EBITDA/Rev');
        $worksheet->setCellValue('B16', 'Net margin');
        $worksheet->setCellValue('B17', 'Deuda/EBITDA');
        $worksheet->setCellValue('B18', 'Asset to revenue ratio');
        
        $worksheet->setCellValue('C15', '=IF(C2=0,C2,IF(C4>=C2,C4/C2,C2/C4))');
        $worksheet->setCellValue('C16', '=IF(C2=0,C2,IF(C5>=C2,C5/C2,C2/C5))');
        $worksheet->setCellValue('C17', '=IF(C4=0,C4,IF(C7>=C4,C7/C4,C4/C7))');
        $worksheet->setCellValue('C18', '=IF(C2=0,C2,IF(C8>=C2,C8/C2,C2/C8))');
       
        $worksheet->setCellValue('G2', '=SUM(D2:D1009)');
        $worksheet->setCellValue('G4', '=IF(G2>=10,"GO","NO-GO")');

        $worksheet->setCellValue('F2', 'Total Score');
        $worksheet->setCellValue('F4', 'Decision');
        
        $worksheet->setCellValue('D15', '=IF(C15>=7%,1,0)');
        $worksheet->setCellValue('D16', '=IF(C16>=5%,1,0)');

        if($x == true){
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="test.xlsx"');
            header('Cache-Control: max-age=0');

            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }else{
            return json_encode(array('total_score' => $worksheet->getCell('G2')->getCalculatedValue(), 'decision' => $worksheet->getCell('G4')->getCalculatedValue()));
        }
    }
}
