<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @property Template $template

 */

class Categorie extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
    }

    public function getAllJsonCategories()
    {

        $this->load->model('Categorie_model');

        $categories = $this->Categorie_model->getAll();

        $this->output->set_content_type("application/json");
        echo json_encode(array("Categories" =>$categories));

    }

    public function getCategorieWithId($id){


        $this->load->model('Categorie_model');

        $categories = $this->Categorie_model->get($id);

        $this->output->set_content_type("application/json");
        echo json_encode(array("Category" =>$categories));



    }





}

?>