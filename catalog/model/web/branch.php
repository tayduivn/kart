<?php
class ModelWebBranch extends Model {

	public function getBranches($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "branch i LEFT JOIN " . DB_PREFIX . "branch_description id ON (i.branch_id = id.branch_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
            
			$sort_data = array(
				'id.title',
				'i.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY id.title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			/*if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}*/

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$branch_data = $this->cache->get('branch.' . (int)$this->config->get('config_language_id'));

			if (!$branch_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch i LEFT JOIN " . DB_PREFIX . "branch_description id ON (i.branch_id = id.branch_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$branch_data = $query->rows;

				$this->cache->set('branch.' . (int)$this->config->get('config_language_id'), $branch_data);
			}

			return $branch_data;
		}
	}

    public function getBranchImages($branch_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_image WHERE branch_id = '" . (int)$branch_id . "' ORDER BY sort_order ASC");

        return $query->rows;
    }
    
}