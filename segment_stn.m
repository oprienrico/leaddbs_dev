%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
root='/PA/Neuro/_projects/lead/lead/templates/segment/';
ages={'E','M','Y'};
sides={'R','L'};

for age=1:length(ages)
    copyfile([root,'pre_tra.nii'],[root,ages{age},'_pre_tra.nii'])
    
    matlabbatch{1}.spm.tools.preproc8.channel.vols = {[root,ages{age},'_pre_tra.nii,1']};
    matlabbatch{1}.spm.tools.preproc8.channel.biasreg = 0.0001;
    matlabbatch{1}.spm.tools.preproc8.channel.biasfwhm = 60;
    matlabbatch{1}.spm.tools.preproc8.channel.write = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(1).tpm = {[root,'STN_',ages{age},'_TPM.nii,1']};
    matlabbatch{1}.spm.tools.preproc8.tissue(1).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(1).native = [1 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(1).warped = [1 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(2).tpm = {[root,'STN_',ages{age},'_TPM.nii,2']};
    matlabbatch{1}.spm.tools.preproc8.tissue(2).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(2).native = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(2).warped = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(3).tpm = {[root,'STN_',ages{age},'_TPM.nii,3']};
    matlabbatch{1}.spm.tools.preproc8.tissue(3).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(3).native = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(3).warped = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(4).tpm = {[root,'STN_',ages{age},'_TPM.nii,4']};
    matlabbatch{1}.spm.tools.preproc8.tissue(4).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(4).native = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(4).warped = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(5).tpm = {[root,'STN_',ages{age},'_TPM.nii,5']};
    matlabbatch{1}.spm.tools.preproc8.tissue(5).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(5).native = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(5).warped = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(6).tpm = {[root,'STN_',ages{age},'_TPM.nii,6']};
    matlabbatch{1}.spm.tools.preproc8.tissue(6).ngaus = 2;
    matlabbatch{1}.spm.tools.preproc8.tissue(6).native = [0 0];
    matlabbatch{1}.spm.tools.preproc8.tissue(6).warped = [0 0];
    matlabbatch{1}.spm.tools.preproc8.warp.mrf = 0;
    matlabbatch{1}.spm.tools.preproc8.warp.reg = 4;
    matlabbatch{1}.spm.tools.preproc8.warp.affreg = 'mni';
    matlabbatch{1}.spm.tools.preproc8.warp.samp = 3;
    matlabbatch{1}.spm.tools.preproc8.warp.write = [1 1];
    
    
    jobs{1}=matlabbatch;
    %cfg_util('run',jobs);
    clear matlabbatch jobs
    
    
    matlabbatch{1}.spm.util.defs.comp{1}.def = {[root,'y_',ages{age},'_pre_tra.nii']};
    matlabbatch{1}.spm.util.defs.ofname = '';
    matlabbatch{1}.spm.util.defs.fnames = {
        [root,'tSTN_L_',ages{age},'.nii,1']
        [root,'tSTN_R_',ages{age},'.nii,1']
        };
    matlabbatch{1}.spm.util.defs.savedir.saveusr = {root};
    matlabbatch{1}.spm.util.defs.interp = 4;
    
    jobs{1}=matlabbatch;
    cfg_util('run',jobs);
    clear matlabbatch jobs
    
    
    
end