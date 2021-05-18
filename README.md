# Ubuntu 20.04 / 20.10 Tweaks on XPS 13 9310 2-in-1 (late 2020 edition)
This repository documents tweaks I found useful to get Dell XPS 13 9310 2-in-1 hardware running under Ubuntu. You may install these software tweaks by using the provided install script at your own risk. 
This repository does not contain dotfiles or installs your favourite applications.

## Quickstart

```bash
wget https://raw.githubusercontent.com/thllwg/xps-9310-2in1-setup-ubuntu/master/setup.sh && sudo chmod +x setup.sh && ./setup.sh
```

## Prerequisistes

XPS 9310 2-in-1 comes pre-installed with Windows 10. There is no Developer Edition with a pre-installed Ubuntu available. 
Install Ubuntu 20.04 or 20.10 alongside Windows or remove Windows entirely.

## Details

A fresh Ubuntu installation on the XPS 13 9310 2-in-1 does neither support the fingerprint reader nor the IR camera (or, more specific, the IR emitters are not activated). 

Unfortunately, there is no solution for the fingerprint reader problem under Linux. Dell provides drivers for the fingerprint reader (Goodix 27c6:533c) of the 9310 under Linux, however, the 9310 2-in-1 is shipped with a different type of fingerprint reader (Goodix 27c6:532d).

For the IR emitter problem, the script in this repository installs a solution adapted from @EmixamPP (https://github.com/EmixamPP/linux-enable-ir-emitter). This allows to subsequently install windows hello style authentication software, e.g. [Howdy](https://github.com/boltgolt/howdy)

Furthermore, drivers from the [Dell focal repository](http://dell.archive.canonical.com/dists/focal-somerville-melisa/) are installed to optimize battery life under linux.



