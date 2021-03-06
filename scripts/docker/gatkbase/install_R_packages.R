source("http://bioconductor.org/biocLite.R")
biocLite("DNAcopy")
#Make sure to use http not https as this will give an "unsupported URL scheme" error
getoptUrl="http://cran.r-project.org/src/contrib/getopt_1.20.0.tar.gz"
if (!("getopt" %in% rownames(installed.packages()))) {
  install.packages(getoptUrl, repos=NULL, type="source")
}
optparseUrl="http://cran.r-project.org/src/contrib/optparse_1.3.2.tar.gz"
if (!("optparse" %in% rownames(installed.packages()))) {
  install.packages(optparseUrl, repos=NULL, type="source")
}
dependencies = c("naturalsort","ggplot2","gplots","reshape","gsalib")
if (!all(dependencies %in% rownames(installed.packages()))) {
  install.packages(setdiff(dependencies, rownames(installed.packages())), repos="http://cran.cnr.Berkeley.edu")
}

# HMM is only required for testing and not in production:
hmmUrl = "http://cran.r-project.org/src/contrib/HMM_1.0.tar.gz"
if (!("HMM" %in% rownames(installed.packages()))) {
  install.packages(hmmUrl, repos=NULL, type="source")
}
q(save="no")
