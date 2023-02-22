function d3d_model_copy() {
    var newmodel;
    d3d_model_save(argument0,working_directory+"\tempmod.dat");
    newmodel = d3d_model_create();
    d3d_model_load(newmodel,working_directory+"\tempmod.dat");
    file_delete(working_directory+"\tempmod.dat");
    return newmodel;
}