<?php

    class Gebruiker_model extends CI_Model
    {

        // +----------------------------------------------------------
        // | TV Shop
        // +----------------------------------------------------------
        // | 2ITF - 2018-2019
        // +----------------------------------------------------------
        // | Gebruiker model
        // +----------------------------------------------------------
        // | M. Decabooter, J. Janssen
        // +----------------------------------------------------------

        function __construct()
        {
            parent::__construct();
        }

        function get($id)
        {
            // geef gebruiker-object met opgegeven $id
            $this->db->where('id', $id);
            $query = $this->db->get('tv_gebruiker');
            return $query->row();
        }

        function getGebruiker($email, $wachtwoord)
        {
            // geef gebruiker-object met $email en $wachtwoord EN geactiveerd = 1
            $this->db->where('email', $email);
            $this->db->where('geactiveerd', 1);
            $query = $this->db->get('tv_gebruiker');

            if ($query->num_rows() == 1) {
                $gebruiker = $query->row();
                // controleren of het wachtwoord overeenkomt
                if (password_verify($wachtwoord, $gebruiker->wachtwoord)) {
                    return $gebruiker;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        }

        function updateLaatstAangemeld($id)
        {
            // pas tijd laatstAangemeld aan
            $gebruiker = new stdClass();
            $gebruiker->laatstAangemeld = date("Y-m-d H:i:s");
            $this->db->where('id', $id);
            $this->db->update('tv_gebruiker', $gebruiker);
        }

        function controleerEmailVrij($email)
        {
            // is email al dan niet aanwezig
            $this->db->where('email', $email);
            $query = $this->db->get('tv_gebruiker');

            if ($query->num_rows() == 0) {
                return true;
            } else {
                return false;
            }
        }

        function insert($naam, $email, $wachtwoord)
        {
            // voeg nieuwe gebruiker toe
            $gebruiker = new stdClass();
            $gebruiker->naam = $naam;
            $gebruiker->email = $email;
            $gebruiker->wachtwoord = password_hash($wachtwoord, PASSWORD_DEFAULT);
            $gebruiker->niveau = 1;
            $gebruiker->creatie = date("Y-m-d H:i:s");
            $gebruiker->laatstAangemeld = 0;
            $gebruiker->geactiveerd = 0;
            $this->db->insert('tv_gebruiker', $gebruiker);
            return $this->db->insert_id();
        }

        function updateGeactiveerd($id)
        {
            // zet geactiveerd op 1
            $gebruiker = new stdClass();
            $gebruiker->geactiveerd = 1;
            $this->db->where('id', $id);
            $this->db->update('tv_gebruiker', $gebruiker);
        }

    }

?>
