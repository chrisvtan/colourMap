// An abstract of a cellular automata (CA) model as part of a Model-View architecture.
abstract class CAView {
  
  // The cellular automata model.
  CA model;
  
  // Class constructor taking as a parameter the model referred to.
  CAView(CA model) {
    this.model = model;
  }
  
  // Resets the data to initial conditions.
  void restart() {}
   
  // Displays the model CA.
  abstract void display();
  
  // Return true iff the CA has completed its run.
  abstract boolean finished();  
}