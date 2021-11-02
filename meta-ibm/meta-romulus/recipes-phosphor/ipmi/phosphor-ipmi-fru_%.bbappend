DEPENDS_append_romulus = " romulus-yaml-config"

EXTRA_OECONF_romulus = " \
    YAML_GEN=${STAGING_DIR_HOST}${datadir}/romulus-yaml-config/ipmi-fru-read.yaml \
    PROP_YAML=${STAGING_DIR_HOST}${datadir}/romulus-yaml-config/ipmi-extra-properties.yaml \
    "

DEPENDS_append_romulus2600 = " romulus-yaml-config"

EXTRA_OECONF_romulus2600 = " \
    YAML_GEN=${STAGING_DIR_HOST}${datadir}/romulus-yaml-config/ipmi-fru-read.yaml \
    PROP_YAML=${STAGING_DIR_HOST}${datadir}/romulus-yaml-config/ipmi-extra-properties.yaml \
    "
