# Acknowledgments

Closet combines original Typst pose and camera code with open-source rendering
software and biomechanical reference data. This document records those
relationships and their roles in the project.

## Rendering

- [Premetadated](https://github.com/baptiste/premetadated), licensed under the
  Mozilla Public License 2.0, supplies the elliptical-nib envelope engine used
  to render every projected bone and head outline. Closet uses its bundled
  Rust/WASM plugin through the public `stroke.nib-stroke` API.
- [CeTZ](https://github.com/cetz-package/cetz) supplies the Typst canvas and
  vector drawing layer used by Closet and Premetadated.

## Biomechanical data

- [OpenSim](https://opensim.stanford.edu/) provides the articulated-model and
  inverse-kinematics formats used by the offline importer.
- The checked-in `data/gait2354.json` and test fixtures are derived from the
  OpenSim Gait2354 model and its sample inverse-kinematics walk at revision
  `d9b05d470b1a481c222372c85b75772faf8f7792` of
  [opensim-models](https://github.com/opensim-org/opensim-models). The source
  model credits Delp et al., Thelen et al., and Seth et al. and is distributed
  under CC BY 3.0. Exact source URLs are retained in the generated JSON.

The OpenSim material is used as development data and provenance for compact
joint ranges and synchronized gait samples. Closet does not bundle OpenSim or
claim that those model ranges are universal physiological safety limits.