## Mod spearheaded by Enrico Opri. Emory University (2020)
changed the following files to have support for unilateral (DBS) leads:
    
## improving handling of elmodel
### added new helper elmodel=ea_get_unique_elmodel(reco.props)
```
    root/helpers/gui/ea_load_pts.m
    root/ea_load_reconstruction.m
    root/templates/electrode_models/ea_resolve_elspec.m

    root/ea_write_planes.m   -> the coord cell array is set to fill out the empty coordinates with NaN, to ensure compatibility with ea_sample_slice.m
    root/ea_sample_slice.m   -> modification was not strictly necessary, but done to ensure compatibility
```
fixed handling of statistics warnings in the unilateral case (which lead dbs sees as missing side==1, Right side, making part of the code fail). 
```
    root/ea_showatlas.m
```
## changed handling of options.sides
```
    TO TEST WELL: ea_calc_vatstats.m

    root/ea_reconstruction2acpc.m
    root/ea_refinecoords.m
    root/ea_elvis.m
    root/ea_exportisovolume.m
    root/ea_reformat_isomatrix.m
    root/ea_load_reconstruction.m
    root/ea_mapelmodel2reco.m    
    root/ea_runtraccore.m
    root/ea_showcorticalstrip.m
    root/ea_showisovolume.m
    root/ea_stimparams.m
    root/ea_write.m
    root/ea_writeplanes.m
    root/helpers/gui/ea_elvisible.m

    root/connectomics/ea_cvshowfiberconnectivities.m
    root/connectomics/ea_cvshowvatfmri.m
    root/connectomics/ea_extract_timecourses_vat.m

    root/ea_runpacer.m -> now handles unilateral left lead
```
this is one of the keypoints for the issue: the electrode models store the coordinates 
in an hardcoded scheme of R for side==1 and L for side==2, in options.sides
```
    root/templates/electrode_models/ea_elspec_adtech_sd10r_sp05x_choi.m
    root/templates/electrode_models/ea_elspec_boston_vercise.m
    root/templates/electrode_models/ea_elspec_dixi_d08_18am.m
    root/templates/electrode_models/ea_elspec_epc_05c.m
    root/templates/electrode_models/ea_elspec_epc_15c.m
    root/templates/electrode_models/ea_elspec_medtronic_3387.m
    root/templates/electrode_models/ea_elspec_medtronic_3389.m
    root/templates/electrode_models/ea_elspec_medtronic_3391.m
    root/templates/electrode_models/ea_elspec_neuropace_dl_344_35.m
    root/templates/electrode_models/ea_elspec_pins_l301.m
    root/templates/electrode_models/ea_elspec_pins_l302.m
    root/templates/electrode_models/ea_elspec_pins_l303.m
    root/templates/electrode_models/ea_elspec_sde_08_s10.m
    root/templates/electrode_models/ea_elspec_sde_08_s10_legacy.m
    root/templates/electrode_models/ea_elspec_sde_08_s12.m
    root/templates/electrode_models/ea_elspec_sde_08_s12_legacy.m
    root/templates/electrode_models/ea_elspec_sde_08_s16.m
    root/templates/electrode_models/ea_elspec_sde_08_s16_legacy.m
    root/templates/electrode_models/ea_elspec_sde_08_s8.m
    root/templates/electrode_models/ea_elspec_sde_08_s8_legacy.m
    root/templates/electrode_models/ea_elspec_stjude_activetip_2mm.m
    root/templates/electrode_models/ea_elspec_stjude_activetip_3mm.m
```
Standardized the "sides" management of these scripts (genvat and others)
```
    root/ea_genvat_dembek.m  
    root/ea_genvat_kuncel.m
    root/ea_genvat_maedler.m
    dev/genprobmaps/ea_normsubcorticalsegm.m
```
and stimparams variable, enforcing that position 1 is right, and position 2 is left.
In addition now the ea_stimparams gui disables the panel for the stimulation settings of the lead that is not present
```
    root/ea_stimparams.m
```

## adding custom script loader (loaded at the init of lead.m)
### the script loaded is : ea_run_extra_leadinitscript.m
here it can handle extra path requirements, such as the exclusion (now default) or inclusion of the package libstdc++.so.6 for unix systems
```
 (un) loaded by : ea_run_extra_leadinitscript.m
```
The preferred action is to install the package matlab-support (on linux/ubuntu), and choose to use system libraries/renaming matlab ones. This is to use a complete toolchain that is fully available in the system.


## bugfix for meshresample in the iso2mesh toolbox
### used by vatmodel
The issue is caused by part of the code that uses matlab's reducepath before running meshresample.
Matlab's reducepath can cause an output that is non-manifold, even if the input is manifold.
This causes issues in the CGAL tool "cgalsimp2" used for the resampling in the iso2mex.
The bugfix is to ensure that the input is manifold, by forcing the meshcheckrepair within meshresample, which repairs the mesh ensuring the manifold condition.
I've also left alternative code (currently not used) to execute meshresample based only on reducepath, but repairing the output to ensuring the manifold condition.

Changed: 
    root/ext_libs/iso2mesh/meshresample.m
    root/vatmodel/ea_mesh_electrode.m -> just left a note/comment