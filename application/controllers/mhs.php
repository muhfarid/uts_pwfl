<?php 


class mhs extends CI_Controller{

	public function tambahmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');


		if (!$this->form_validation->run()==false) {
			$this->m_mhs->tambah_mhs();
			redirect('mhs2/');
		}else {
			redirect('mhs2/tambahmhs');
		}
	}
	public function editmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');

		if ($this->form_validation->run()!=false) {
			$this->m_mhs->edit_mhs();
			redirect('mhs2');
		}else{
			redirect('mhs2/editmhs');
		}
	}

	public function hapusmhs($id) {
		if ($id != ""){
			$this->m_mhs->hapus_mhs($id);
			redirect('mhs2');
		}else{
			redirect('mhs2');
		}
	}
	
}

