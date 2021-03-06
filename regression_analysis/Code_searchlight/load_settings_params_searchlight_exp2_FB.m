function [ settings, params ] = load_settings_params_searchlight_exp2_FB(settings, params )
    
%% paths

settings.path_Data = '/data/libi/MRI_data/Face_Object_Integration/data_mat_files_m';
settings.path_Results = './Results/searchlight_exp1_FB';
settings.path_Figures = './Figures/searchlight_exp1_FB';
% settings.path_spm8 = '/usr/local/spm8';


%%
settings.method = 'Euclidean'; % options: 'SVM' 'Correlationa'

settings.file_header_info = 'SL';

settings.data.data_type = 'PercSigCh'; % PercSigCh, Beta
settings.data.cv = 'ALL_TOGETHER'; % LORO = Leave-One-Run-Out cross validation
settings.data.data_design = 'FB_model';
settings.data.sample_type = 'UNITE_ROIS'; %'UNITE_ROIS'; 'OVERLAP_ROIS' 'CONTRASTS', 'ROIs'
settings.data.normalize = 0; % if 1 than normalization (zscore of data) is performed




settings.min_voxel_num = 20;
settings.exact_voxel_num = 20;

settings.cond_names = {'Face' 'Body' 'Person'};
settings.A_cond_name = 'Face'; % first single, weight is alpha
settings.B_cond_name = 'Body'; % second cond, weight is beta
settings.C_cond_name = 'Person'; % combined cond


%% masks 
% if there are no masks to apply for the data, set an empty value for the masks:
% settings.masks = [];
settings.masks(1).type = 'mask_values';
settings.masks(1).header = 'Brain_activation_mask_loc';

settings.masks(2).type = 'mask_values';
settings.masks(2).header = 'Brain_activation_mask_FB_model';


%% rois overlaps and exclusions
% relevant only if settings.data.sample_type='ROIs'
settings.rois.names = { 'LOC_FaceBodyObject_left_roi'    % 1
                        'LOC_FaceBodyObject_right_roi'   % 2
                        'CSF_roi' %3
                        'EVC_roi' %4
                        }; 
                        
settings.roi.cont_t_vals = {'Cont_loc_Face_Bodies_Objects>Scrambled'
                            'Cont_loc_Face_Bodies_Objects>Scrambled'
                            'CSF'
                            'GM'
                            };
%                         

settings.t_vals.cont_t_vals = {'Cont_loc_Faces>all_others' 
                            'Cont_loc_Bodies>all_others'
                            'Cont_loc_Objects>all_others' 
                            'Cont_loc_Faces>Bodies'
                            'Cont_loc_Faces>Objects'
                                }; 

settings.t_vals.names = {'Face > others'
                         'Body > others'
                         'Object > others'
                         'Face > Body'
                         'Face > Object'
                         }; 
                                
settings.rois.union_roi_headers = {'Category_Left'
                                    'Category_Right'
                                    'Category_All'
                                    'CSF'
                                    'EVC'};
%                                 
settings.rois.orig_rois_for_unite = {[1] [2], [1,2],[3],[4]};


%% fixed params

params.seed = 1; % the seed for the randomize

