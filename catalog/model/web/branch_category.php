<?php
class ModelWebBranchCategory extends Model {

	public function getCategories($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "branch_category i LEFT JOIN " . DB_PREFIX . "branch_category_description id ON (i.branch_category_id = id.branch_category_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

            if (isset($data['is_home'])) {
                $sql .= " AND i.is_home = " . $data['is_home'];
            }
            
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

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$category_data = $this->cache->get('branch_category.' . (int)$this->config->get('config_language_id'));

			if (!$category_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_category i LEFT JOIN " . DB_PREFIX . "branch_category_description id ON (i.branch_category_id = id.branch_category_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$category_data = $query->rows;

				$this->cache->set('branch_category.' . (int)$this->config->get('config_language_id'), $category_data);
			}

			return $category_data;
		}
	}
 
    
    public function getCategory($category_id) {
		$category_description_data = array();

		$query = $this->db->query("SELECT DISTINCT i.*, id.* FROM " . DB_PREFIX . "branch_category i LEFT JOIN " . DB_PREFIX . "branch_category_description id ON (i.branch_category_id = id.branch_category_id) WHERE id.branch_category_id = '" . (int)$category_id . "'");

		return $query->row;
	}
    
}