<?php
class Vragen_model extends CI_Model
{



    function __construct()
    {
        parent::__construct();
    }

    function get($id)
    {
        $this->db->where('categorieID', $id);
        $query = $this->db->get('Product');
        return $query->result();
    }

    function getAllQuestions()
    {

        $this->db->order_by('vraagID');
        $query = $this->db->get('FeedbackVragen');
        return $query->result();


    }



}