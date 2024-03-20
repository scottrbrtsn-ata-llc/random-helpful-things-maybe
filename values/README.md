# Developer Values

#### Disclaimer

>We recognize we live in the real world, and the things we value are often not our reality.  This collection is what we strive toward, how we aim to be better every day, our kaizen and Ulysses Pact.

## Mission statement

>Some collection of words we can return to to ensure the bearing of the ship is true.

---------


### Sane development processes

1. Any sliver of development should be able to be done end-to-end on an individual laptop.
1. Working on [state of the art hardware](https://github.com/scottrbrtsn-ata-llc/random-helpful-things-maybe/tree/master/values#state-of-the-art-hardware) under our desk forces us to understand our technology, optimize with best practices, and ensure robust capability by constraining what is available.
1. Working in a constrained environment also [reduces cognitive load](https://github.com/scottrbrtsn-ata-llc/random-helpful-things-maybe/tree/master/values#reduced-cognitive-load) as we remove extraneous layers (e.g. kubernetes, manual build/integration/deployment pipelines)

### Robust testing

1. Sufficient and necessary testing of the limitations of our system.
    1. e.g. edge cases, deploy from zero, limitations at scale.

### Sane, automated, integration and deployment processes

1. Automation is King.  The "C" in CI/CD, is continuous == automated/automatic.
    1. Opening a PR should trigger checks, builds, tests...etc...
    1. Merging to a default branch should check all the things, and deploy. 
1. One UX principle aims at reducing clicks for users. Efforts to reduce clicks and even keystrokes are paramount.
1. Deployments should never interrupt user/stakeholder behavior.
    1. A/B deployments, rollbacks, etc...
    1. See "Sane integration and deployment"
1. Nix
    1. reproducible, reliable builds.
1. The cloud is for deployments. We should not be developing directly in the cloud. 
1. We should always be able to develop without blocking, interrupting, nor breaking one another's efforts.

### Reduced cognitive load
1. We want long careers in software, but the growth of perceived complexity is becoming unmanageable.
1. Reducing cognitive load buffers against: burnout, attrition, poor onboarding, etc...
1. [Dijkstra was outspoken about this](https://quotefancy.com/quote/1164258/Edsger-W-Dijkstra-Programming-in-Basic-causes-brain-damage)
    1. He also wrote a letter, where he speaks of [the goto statement is considered harmful](https://dl.acm.org/doi/10.1145/362929.362947)
    1. These ideas touch on things we must consider: certain practices in software engineering could actually be physically, literally, harming our brains, and each other.
    1. What kinds of practices might contribute to our trauma in today's software industry?

### Robust communication methods in a remote world.

1. Embrace asynchronous communication.
1. Psychologically safe communication environments.   

### On the matter of expertise

1. We strive to establish credibility through action and objective metrics, not words.   


### State of the art hardware

1. In 2024, operating without GPUs is not a recipe for success. 

### Design Reviews?

1. ADRs and other design processes to allow alternative opinions should be in place.

### Sane business practices
1. We should not be paying, or managing (which is its own cost) for infrastructure, when we have no paying customers.


