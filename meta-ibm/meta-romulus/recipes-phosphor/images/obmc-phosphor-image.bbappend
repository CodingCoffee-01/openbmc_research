OBMC_IMAGE_EXTRA_INSTALL_append_romulus = " mboxd tree nano pciutils liberation-fonts uart-render-controller"

OBMC_IMAGE_EXTRA_INSTALL_append_romulus2600 = " mboxd tree nano pciutils liberation-fonts uart-render-controller"

inherit extrausers

#IBM_EXTRA_USERS_PARAMS += " \
#  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
#  "

# Add group "wheel" (before adding the "service" account).
IBM_EXTRA_USERS_PARAMS += " \
  groupadd wheel; \
  "

# Add the "admin" account.
IBM_EXTRA_USERS_PARAMS += " \
  useradd -M -d / --groups priv-admin,redfish,web -s /sbin/nologin admin; \
  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' admin; \
  "

# Add the "service" account.
IBM_EXTRA_USERS_PARAMS += " \
  useradd -M -d / --groups priv-admin,redfish,web,wheel service; \
  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' service; \
  "

# This is recipe specific to ensure it takes effect.
EXTRA_USERS_PARAMS_pn-obmc-phosphor-image += "${@bb.utils.contains('DISTRO_FEATURES', 'ibm-service-account-policy', "${IBM_EXTRA_USERS_PARAMS}", '', d)}"

# The service account needs sudo.
IMAGE_INSTALL_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ibm-service-account-policy', 'sudo', '', d)}"

