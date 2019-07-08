<?php
class ModelWebNewsletter extends Model {



	public function deleteNewsletter($newsletter_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "newsletter` WHERE newsletter_id = '" . (int)$newsletter_id . "'");

		$this->cache->delete('newsletter');
	}

	public function getNewsletter($newsletter_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter WHERE newsletter_id = '" . (int)$newsletter_id . "'");

		return $query->row;
	}

	public function getNewsletters($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "newsletter i";

			$sort_data = array(
				'i.number',
				'i.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY i.number";
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
			$newsletter_data = $this->cache->get('newsletter.' . (int)$this->config->get('config_language_id'));

			if (!$newsletter_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter i");

				$newsletter_data = $query->rows;

				$this->cache->set('newsletter.' . (int)$this->config->get('config_language_id'), $newsletter_data);
			}

			return $newsletter_data;
		}
	}

	public function getTotalNewsletters() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newsletter");

		return $query->row['total'];
	}
}