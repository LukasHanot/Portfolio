<?php
class Antwoorden_model extends CI_Model
{



    function __construct()
    {
        parent::__construct();
    }



    function getAll()
    {


        $query = $this->db->get('FeedBackAntwoorden');
        return $query->result();


    }
}