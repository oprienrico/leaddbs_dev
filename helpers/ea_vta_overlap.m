function [vox_overlap, mm_overlap, vox_vat, mm_vat, mm_atlas] = ea_vta_overlap(vta, atlas, side)
% Calculate the overlap between VTA and atlases (nifti or xyz coordinates)
%
%  vox_ is in VOXEL, mm_ is in MM^3

% Split left/right side of the atlas
if ~exist('side', 'var')
    side = 'both';
elseif ischar(side)
    side = lower(side);
elseif isnumeric(side)
    if side==1
        side = 'right';
    elseif  side==2
        side = 'left';
    else
        side = 'both';
    end
end

vox_overlap = 0;
mm_overlap = 0;

% Load VTA image
vtanii = load_untouch_nii(vta);
vtanii.img = double(vtanii.img);

if contains(vta, 'efield') % Input vta is efield_[right|left].nii
    % Threshold the efield to avoid leak overlap
    prefs = ea_prefs;
    efiedthreshold = prefs.machine.vatsettings.horn_ethresh*10^3;
    vtanii.img(vtanii.img<=efiedthreshold) = 0;
else % Input vta is vat_[right|left].nii
    % Make sure the vta image is really binary
    threshold_vta = max(vtanii.img(:)) * 0.5;
    vtanii.img = double(vtanii.img>threshold_vta);
end
vat_voxsize = prod(ea_detvoxsize(vta));

% Check if atlas is nifti file or xyz coordinates
if isnumeric(atlas)
    xyz = atlas;
elseif isfile(atlas)
    atlasnii = load_untouch_nii(atlas);
    threshold = max(atlasnii.img(:)) * 0.5;
    atlasnii.img = atlasnii.img > threshold;
    [xvox, yvox, zvox] = ind2sub(size(atlasnii.img), find(atlasnii.img(:)));
    xyz = ea_vox2mm([xvox, yvox, zvox], atlas);
end
atlas_voxsize = prod(ea_detvoxsize(atlas));

% Only calculate for one side, suppose RAS orientation
switch side
    case 'right'
        xyz = xyz(xyz(:,1)>0,:);
    case 'left'
        xyz = xyz(xyz(:,1)<0,:);
end


vox_vat=sum(vtanii.img(:)>0);%store the number of voxels contained in the VTA/efield
mm_vat=vox_vat.*vat_voxsize;%store in mm too
mm_atlas=sum(atlasnii.img(:)>0).*atlas_voxsize;%store the atlas volume used in the overlap (in mm) too

if ~isempty(xyz)
    % Map XYZ coordinates into VTA image
    vox = round(ea_mm2vox(xyz, vta));
    filter = all(vox>[0,0,0],2) & all(vox<=size(vtanii.img),2); % Remove voxel out of bbox
    if any(filter)
        vox = vox(filter, :);
        ind = unique(sub2ind(size(vtanii.img), vox(:,1), vox(:,2), vox(:,3)));
        % Checking overlap for image1
        vox_overlap = sum(vtanii.img(ind));
        
        mm_overlap=vox_overlap.*vat_voxsize;
    end
end
