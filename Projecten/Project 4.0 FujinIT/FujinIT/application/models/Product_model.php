<?php
class Product_model extends CI_Model
{



    function __construct()
    {
        parent::__construct();
    }

    function get($id)
    {
        $this->db->where('productID', $id);
        $query = $this->db->get('Product');
        return $query->row();
    }

    function getAllProducten()
    {

        $this->db->order_by('categorieID');
        $query = $this->db->get('Product');
        return $query->result();


    }
    function getAllWithID($id){

        $this->db->where('categorieID', $id);
        $query = $this->db->get('Product');
        return $query->result();






    }
}