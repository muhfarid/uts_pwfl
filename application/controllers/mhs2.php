<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class mhs2 extends CI_Controller
{
	
	public function index ()
	{
		$data['mhs'] = $this->m_mhs->ambilmhs();
		$this->load->view('tampil',$data);
	}

	public function tambahmhs()
	{
		$this->load->view('tambah');

	}

	public function editmhs($id)
	{
		$data['mhs'] = $this->m_mhs->editambilmhs($id);
		$this->load->view('edit',$data);	

	}
}
