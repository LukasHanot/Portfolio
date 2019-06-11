<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @property Template $template

 */

class Vragen extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
    }

    public function getAllJsonQuestions()
    {


        $this->load->model('Vragen_model');

        $vragen = $this->Vragen_model->getAllQuestions();

        //Randomization of questions


        $rand_vragen = array_rand($vragen, 3);
        $i = 0;
        foreach ($rand_vragen as $random){


            $output[$i]= $vragen[$random];
            $i ++;

        }

        $this->output->set_content_type("application/json");
        echo json_encode(array("Questions" => $output));


    }
}

?>