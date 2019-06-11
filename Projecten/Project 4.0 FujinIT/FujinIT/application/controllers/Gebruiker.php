<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

    /**
     * @property Template $template
     * @property Authex $authex
     * @property Email $email
     */
    class Gebruiker extends CI_Controller
    {


        public function __construct()
        {
            parent::__construct();
            $this->load->helper('form');
        }

        public function maakGebruiker($naam, $email, $wachtwoord)
        {
            $this->load->model('Gebruiker_model');
            $data['users'] = $this->Gebruiker_model->insert($naam, $email, $wachtwoord);


        }
        public function meldAan()
        {
            $data['gebruiker'] = $this->authex->getGebruikerInfo();


            $this->load->view('login',$data);
        }

    }

    /* End of file User.php */
    /* Location: ./applications/tvshop/controllers/User.php */
