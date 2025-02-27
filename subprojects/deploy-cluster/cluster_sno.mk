cluster_sno:
	@make all
	@make has_installer
	@make config_base_install
	@make config_sno
	@make diff
	@make manifest
	@make manifest_entitle
	@make manifest_entitle_master
	@make install
	@make kubeconfig

sno: cluster_sno

# ---

config_sno:
	yq -yi '.controlPlane.replicas=1' "${CLUSTER_PATH}/install-config.yaml"
	yq -yi 'del(.compute[0].platform)'  "${CLUSTER_PATH}/install-config.yaml"
	yq -yi '.compute[0].replicas=0'  "${CLUSTER_PATH}/install-config.yaml"
