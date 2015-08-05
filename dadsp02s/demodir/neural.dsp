@pause(2)

removewin(-1) @cr
addwin(6) @cr
@pause(1)
@pop("p1",-1,-1,"  DADiSP/NeuralNet  ")
@pause(4)
@unpop("p1")

macread("demodir\demonnet.mac") @CR
echo("DADiSP/NeuralNet") @CR

@pop("p2", -1, -1, 
"
   DADiSP/NeuralNet is a menu driven module which

   allows for the design and use of Neural Networks

   for pattern recognition and classification.
") 
@pause(8)
@unpop("p2")

@pop("p3", -1,-1, 
"
   Neural Networks are able to recognize underlying patterns   

   and predict outcomes based upon incomplete or inconsistent   

   information.  Neural Networks are able to learn and adapt   

   to changes in the environment, as opposed to expert systems,   

   which use a static set of rules.
")

@pause(12)
@unpop("p3")

@pop("p1", -1, -1, 
"
   DADiSP/NeuralNet uses a back-propagation learning algorithm.   

   A back-propagation neural network develops its predictive 

   capabilities by being trained on a set of historical inputs   

   and known resulting outputs.
")
@pause(12)
@unpop("p1") 

@pop("p2", 32, 10, 
"
  Here is the main menu for DADiSP/NeuralNet.  
") 
@pause(2)
@unpop("p2")
nn@cr
@pause(8)
@cr
@pop("p2", 32, 8, 
"
  The Multi-Layer Perceptron Training

  and Design menu has options for 

  input normalization, network training, 

  and analysis of the Neural Network.
")
@pause(10)
@unpop("p2")
@pop("p1",32,8,
"
  Preprocessing of the data is one of the

  largest problems in using neural network

  tools.  DADiSP/NeuralNet is fully 

  integrated with the DADiSP Worksheet, 

  so hundreds of analysis functions are available

  to pre- and post-process neural network data.
")
@pause(14)
@unpop("p1")

@dn
@cr
@pop("p1", 32, 8, 
"
  When designing your neural network, 

  you can select the number of hidden layers

  for normal, or cross-validation design.
") 
@pause(12)
@unpop("p1")
@ESC
@ESC
@pop("p1",30,8,
"
  Once the network has been trained, and the

  appropriate variable weights have been set

  that minimize the difference between 

  expected and actual output from the neural  

  net, it can then be applied to new data for

  classification.
")
@pause(14)
@unpop("p1")

@DN
@CR
@pop("p1",32,8,
"
  Simply specify the Window with the new input

  patterns, and the Window with the neural 

  network weights, and DADiSP/NeuralNet will

  generate the new output series.
")
@pause(10)
@unpop("p1")
@ESC
@ESC

@pop("p1",-1,-1,
"
  To view the menus in DADiSP/NeuralNet, type

  NN at the command line in an interactive session.
")
@pause(8)
@unpop("p1")
@pause(1)
dmf("DemModul.men") @CR

