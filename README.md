# Paper_machineLearning_project
DataSets and Scripts related to Machine Learning ANN models

# Classification Learner, session and DataSets:
DataSets were generated and formated with App [link to project]. 
Then imported to this project and desoredered with `shuffleDataBaseGen_<signalName>.m` script. 
This leads in three Training dataset encapsulated in `<signalName>_workspace.mat` file.
Classification Learner Tool Box was used to train and test different ANN models. To check this out follow the next steps
- Load the file `<signalName>_workspace.mat` in Matlab Workspace.
- Open Classifier Learner Tool Box and then load the respective toolbox session from workspace, for instance, 
Sinc_30params_ClassificationLearnerSession_shuffleDataSet.mat when checking 30 parameter from Sinc signal.
- All trained models will be listed and ready to test. First, trained model parameters are avaible as shown in figure.
- Then, go to Test label from tool box and load different dataset to test each trained model as shown in figure.
- Do this for every signal loading the right session at 30 or 4 params.

<figure>
  <p align="center">
  <img src="./Images/ClassificationLearner_Sinc30Params_TrainParameters.jpg" width="500">
  </p>
</figure>
<p align="center">
	Trained model parameters.
</p>

<figure>
  <p align="center">
  <img src="./Images/ClassificationLearner_Sinc30Params_Test_MC.jpg" width="500">
  </p>
</figure>
<p align="center">
	Confusion Matrix test with 25dB SNR data test.
</p>

<figure>
  <p align="center">
  <img src="./Images/Model_Params_30_ESSC.jpg" width="500">
  </p>
</figure>
<p align="center">
	Full Model params for Sinc, Gauss and Chirp signal trained with 30 ESSC dataset at 25dB SNR.
</p>

# Execution Timea measure:
To measure algorithm excecution time load to workspace `<signal-type>_<filter-deformation-type>_25dB_testElement` raw data signal 
and `<signal-type>_exportedTrainedModels.mat` to test different models. First .mat file will load Raw signal with a filter deformation, 
two 1x1024 element are loaded, one for amplitude and the other for time. This raw data signal is necessary
to test "ESSC extraction feature + ANN classification" (check figure schema) excecution time. Then, with
`timeMeasure_<signal-type>.m` script and timeit Matlab function  each processing time value represents the average of 100 algorithm
executions.

<figure>
  <p align="center">
  <img src="./Images/preprocessingAlgorithm.jpg" width="500">
  </p>
</figure>
<p align="center">
	Real Signal with filters, ESSC extraction algorithm and ANN classifier schema.
</p>

# Ranking Features:

In folder `<signal-type_ann_manually>` 

# File Table List:

| Folder / File              				|              Description			      |
|-------------------------------------------------------|-----------------------------------------------------|
| `<signal>_workspace.mat`				| Formated Datasets to be used in Classification Learner|
| `<signal>_<num_params>params_ClassificationLearnerSession_shuffleDataSet.mat`|Classification Learner Session File|
| `<signal>_exportedTrainedModels.mat`			| Exported Object model file     |
| `<signal>_<filter-deformation>_25dB_testElement`	| Raw Signal data used to measure ESSC extraction feature + ANN classification execution time|	

<p align="center">
	Table 1: Files used in project.
</p>


































