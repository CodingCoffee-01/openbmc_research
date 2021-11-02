FILESEXTRAPATHS_prepend_romulus := "${THISDIR}/${PN}:"

EXTRA_OEMESON_romulus += "-Dwarm-reboot=disabled"

FILESEXTRAPATHS_prepend_romulus2600 := "${THISDIR}/${PN}:"

EXTRA_OEMESON_romulus2600 += "-Dwarm-reboot=disabled"
