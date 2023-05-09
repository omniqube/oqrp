function _mp_disconnect(){
	disconnect();
	network_destroy(mp_client.client);
}