# postProcess -func sampleMagSqr
# postProcess -func sampleAvgMagSqr

#postProcess -func sampleAM

#postProcess -func sampleForcesMomentLids
#postProcess -func sampleForcesMomentWall


postProcess -func vorticity
postProcess -func createGradU
postProcess -func sampleEB


postProcess -func SampleVertSection
postProcess -func SampleCrossSection
