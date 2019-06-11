<?php
class Feedback_model extends CI_Model
{



    function __construct()
    {
        parent::__construct();
    }


    function insert($input) {
        $this->db->insert('FeedBackAntwoorden', $input);
        //return $this->db->insert_id();
    }

    public function getAllGroupedFeedback(){


        $this->db->select('*, COUNT(antwoord) as total');
        $this->db->group_by('vraagID');
        $this->db->order_by('vraagID', 'asc');
        $query = $this->db->get('FeedBackAntwoorden');
/*
        $this->db->select('user_id, COUNT(user_id) as total');
        $this->db->group_by('user_id');
        $this->db->order_by('total', 'desc');
        $this->db->get('tablename', 10);
*/
        return $query->result();


    }
    public function getAverage(){


        $this->db->select('*, avg(antwoord) as avg');
        $this->db->group_by('vraagID');
        $this->db->order_by('vraagID', 'asc');
        $query = $this->db->get('FeedBackAntwoorden');
        return $query->result();

    }

    public function getAll(){


        $query = $this->db->get('FeedBackAntwoorden');

        return  $query->result();



    }







}









