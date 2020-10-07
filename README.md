LEAD-DBS ___mod! (UNOFFICIAL fork/modified version)
========

## this LEAD DBS version was modified to enable full support of the cases with unilateral DBS leads
Refer to modREADME.md for the files that were modified.
For installation follow the same steps listed below at "Development installation"

## What works
In single patient mode fixed the track reconstruction and 2D plot (e.g. case with only left lead)
In group mode fixed 3D plot.
The VAT computation fix is still a work in progress for the unilateral cse.

# ORIGINAL CONTENT OF README

LEAD-DBS is ***NOT*** intended for clinical use!

## About Lead-DBS

LEAD-DBS is a MATLAB toolbox facilitating the:

- reconstruction of deep-brain-stimulation (DBS) electrodes in the human brain on basis of postoperative MRI and/or CT imaging
- the visualization of localization results in 2D/3D
- a group-analysis of DBS-electrode placement results and their effects on clinical results
- simulation of DBS stimulations (calculation of volume of activated tissue – VAT)
- diffusion tensor imaging (DTI) based connectivity estimates and fiber-tracking from the VAT to other brain regions (connectomic surgery)

## Installation

#### Prerequisites

- Recommended RAM size: 16GB or more
- MATLAB version: R2016b (MATLAB 9.1) or later
- MATLAB Image Processing Toolbox
- MATLAB Signal Processing Toolbox
- SPM12

#### Normal installation

Lead-DBS can be downloaded from our website (www.lead-dbs.org) in fully functional form.

#### Development installation

Alternatively, especially in case you wish to modify and contribute to Lead-DBS, you can

- Clone the Lead-DBS repository from [github](https://github.com/netstim/leaddbs.git).
- Download the necessary [data](http://www.lead-dbs.org/release/download.php?id=data_pcloud) and unzip it into the cloned git repository.

We’d love to implement your improvements into Lead-DBS – please contact us for direct push access to Github or feel free to add pull-requests to the Lead-DBS repository.

## Getting started

You can run Lead-DBS by typing "lead demo" into the Matlab prompt. This will open up the main GUI and a 3D viewer with an example patient.
But there's much more to explore. Head over to https://www.lead-dbs.org/ to see a walkthrough tutorial, a manual, some more screenshots and other ressources. There's also a helpline in form of a Slack channel. We would love to hear from you.

## Questions

If you have questions/problems when using Lead-DBS, you can checkout our:

- Online [manual](https://netstim.gitbook.io/leaddbs/)
- Workthrough [videos](https://www.lead-dbs.org/helpsupport/knowledge-base/walkthrough-videos/)
- Knowledge [base](https://www.lead-dbs.org/helpsupport/knowledge-base/) (including [methods](https://www.lead-dbs.org/helpsupport/knowledge-base/lead-dbs-methods/), [cortical](https://www.lead-dbs.org/helpsupport/knowledge-base/atlasesresources/cortical-atlas-parcellations-mni-space/)/[subcortical](https://www.lead-dbs.org/helpsupport/knowledge-base/atlasesresources/atlases/) atlases, [connectomes](https://www.lead-dbs.org/helpsupport/knowledge-base/atlasesresources/normative-connectomes/), etc.)
- Support [forum](https://www.lead-dbs.org/?forum=lead-dbs-support-forum)
- [Auto-invite](https://leadsuite.herokuapp.com/) Slack [workspace](https://leadsuite.slack.com/)
