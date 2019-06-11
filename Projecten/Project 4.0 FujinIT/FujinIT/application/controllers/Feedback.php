<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @property Template $template

 */

class Feedback extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
    }

    public function insertFeedback()
    {
        $this->load->model('Feedback_model');

        $data1 = array(
            'antwoord' => $this->input->get('antwoord1'),
            'vraagID' => $this->input->get('vraagID1'),


        );
        $data2 = array(

            'antwoord' => $this->input->get('antwoord2'),
            'vraagID' => $this->input->get('vraagID2'),


        );
        $data3 = array(

            'antwoord' => $this->input->get('antwoord3'),
            'vraagID' => $this->input->get('vraagID3'),

        );

        $this->db->set($data1);
        $this->Feedback_model->insert($data1);
        $this->db->set($data2);
        $this->Feedback_model->insert($data2);
        $this->db->set($data3);
        $this->Feedback_model->insert($data3);

    }

    public function getAllGroupedFeedback(){

        $data['titel'] = 'Grafieken';

        $this->load->model('Feedback_model');

        $data['feedbacks'] = $this->Feedback_model->getAllGroupedFeedback();


        $this->load->view('grafieken', $data);

    }
    public function getAvgQuestions(){

        $data['titel'] = 'Grafieken';

        $this->load->model('Feedback_model');

        $data['feedbacks'] = $this->Feedback_model->getAverage();


        $this->load->view('gemiddelde', $data);

    }

    public function getAllResutlts(){

        $this->load->model('Vragen_model');
        $this->load->model('Antwoorden_model');
        $questions = array();
        $resultset = $this->Vragen_model->getAllQuestions();
        $resultset2= $this->Antwoorden_model->getAll();


        foreach ($resultset as $i=>$row) {

            $questions[$row->vraagID]=array();
            $questions[$row->vraagID]['0.0'] = 0;
            $questions[$row->vraagID]['0.5'] = 0;
            $questions[$row->vraagID]['1.0'] = 0;
            $questions[$row->vraagID]['1.5'] = 0;
            $questions[$row->vraagID]['2.0'] = 0;
            $questions[$row->vraagID]['2.5'] = 0;
            $questions[$row->vraagID]['3.0'] = 0;
            $questions[$row->vraagID]['3.5'] = 0;
            $questions[$row->vraagID]['4.0'] = 0;
            $questions[$row->vraagID]['4.5'] = 0;
            $questions[$row->vraagID]['5.0'] = 0;
            $questions[$row->vraagID]['Titel'] = $row->vraag;




        }
        foreach ($resultset2 as $i=>$row){

            $questions[$row->vraagID][$row->antwoord]=$questions[$row->vraagID][$row->antwoord]+1;

        }
        //echo print_r($questions);
        $data['questions']= $questions;

        $this->load->view('results',$data);

    }




}

?>