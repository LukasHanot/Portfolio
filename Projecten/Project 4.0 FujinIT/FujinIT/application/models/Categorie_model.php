<?php
class Categorie_model extends CI_Model
{



    function __construct()
    {
        parent::__construct();
    }

    function get($id)
    {
        $this->db->where('categorieID', $id);
        $query = $this->db->get('Categorie');
        return $query->row();
    }

    function getAll()
    {

        $this->db->order_by('categorieID');
        $query = $this->db->get('Categorie');
        return $query->result();


    }
}