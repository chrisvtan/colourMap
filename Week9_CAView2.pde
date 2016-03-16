// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Wolfram Cellular Automata

// Simple demonstration of a Wolfram 1-dimensional cellular automata
// When the system reaches bottom of the window, it restarts with a new ruleset
// Mouse click restarts as well

// The CA model (shared by all views).
CA ca;

// The current CA view.
CAView view;

// The list of all views.
ArrayList<CAView> views;

// The current view index.
int currentViewId;

// Counter for managing delay between refresh.
int delay = 0;

// Number of time frames before auto refreshing of CA.
final int N_TIME_FRAMES_BETWEEN_REFRESH = 30;

// Size of CA.
final int CELL_WIDTH = 5;

// An initial rule system.
final int[] INITIAL_RULESET = {
  0, 1, 0, 1, 1, 0, 1, 0
};    

// Initializes objects and window.
void setup() {
  // Basic setups.
  size(800, 200);
  frameRate(30);

  // Initialize CA
  ca = new CA(INITIAL_RULESET, width/CELL_WIDTH);                 

  // Create available views.
  views = new ArrayList<CAView>();
  views.add(new BestView(ca));
  views.add(new BestView(ca, #ff0000, #00ffff));

  // Set current view.  
  currentViewId = 0;
  view = views.get(currentViewId);
}

// Draws elements using current view.
void draw() {
  // Draw the CA using current view.
  view.display();

  // Create next generation of CA states.
  ca.generate();

  // If we're done, clear the screen, pick a new ruleset and restart.
  if (view.finished()) {   
    delay++;
    if (delay > N_TIME_FRAMES_BETWEEN_REFRESH) {
      // Reset everything.
      resetAll();
      delay = 0;
    }
  }
}

// Event management of mouse pressed.
void mousePressed() {
  // Reset everything.
  resetAll();

  // Get next view.
  currentViewId = (currentViewId+1) % views.size();
  view = views.get(currentViewId);
}

// Resets view and model.
void resetAll() {
  // Reinit model.
  ca.randomize();
  ca.restart();

  // Restart view.
  view.restart();
}