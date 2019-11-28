# qsudo
Grahical front-end to launching applications through "sudo", and promting for password as needed.

**Core component of Project Trident**
[https://project-trident.org](https://project-trident.org)

## License
Available under the 2-Clause BSD License

## Requirements
* Qt 5.10+ modules:
   * core
   * gui
   * widgets
* For build only:
   * Qt Linguist (assembling translations)
* For runtime:
   * "sudo" utility

## How to build
* `cd src-qt5`
* `qmake`
* `make install`

## History
Originally written for TrueOS by Kris Moore in 2016, this utility was given over to Project Trident in 2018 when TrueOS depricated all of their graphical utilities.
It has been maintained and updated by Project Trident since 2018.
