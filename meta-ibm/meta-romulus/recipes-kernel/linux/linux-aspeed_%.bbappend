FILESEXTRAPATHS_prepend_romulus := "${THISDIR}/${PN}:"
FILESEXTRAPATHS_prepend_romulus2600 := "${THISDIR}/${PN}:"

SRC_URI_append_romulus = " file://romulus.cfg"
SRC_URI_append_romulus2600 = " file://romulus2600.cfg"
