<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @property Template $template

 */

class Product extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
    }

    public function getAllJsonProducten()
    {


        $this->load->model('Product_model');

        $producten = $this->Product_model->getAllProducten();

        $this->output->set_content_type("application/json");

        echo json_encode(array("Products" => $producten));


    }
    public function getAllJsonProductenOfCategorie($id)
    {


        $this->load->model('Product_model');

        $producten = $this->Product_model->getAllWithID($id);

        $this->output->set_content_type("application/json");

        echo json_encode(array("Products" => $producten));


    }
    public function getAll()
    {

        $this->db->order_by('productID');
        $query = $this->db->get('Product');
        return $query->result();


    }

    public function getProductWithId($id){

        $this->load->model('Product_model');

        $categories = $this->Product_model->get($id);

        $this->output->set_content_type("application/json");
        echo json_encode(array("Product" =>$categories));




    }





}

?>