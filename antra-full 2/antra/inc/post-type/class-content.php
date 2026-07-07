<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

require get_theme_file_path('inc/post-type/functions.php');
$files_custom = glob(get_theme_file_path('/inc/post-type/functions/*.php'));
foreach ($files_custom as $file) {
	if (file_exists($file)) {
		require_once $file;
	}
}

/**
 * Antra Posttype shortcode class.
 */
class Antra_Posttype {

	/**
	 * Posttype.
	 *
	 * @var   string
	 */
	protected $post_type = '';

	/**
	 * Attributes.
	 *
	 * @var   array
	 */
	protected $attributes = array();

	/**
	 * Query args.
	 *
	 * @var   array
	 */
	protected $query_args = array();

	/**
	 * Set custom visibility.
	 *
	 * @var   bool
	 */
	protected $custom_visibility = false;

	/**
	 * Initialize shortcode.
	 *
	 * @param array  $attributes Shortcode attributes.
	 * @param string $post_type Postt type.
	 */
	public function __construct( $post_type, $attributes = array() ) {
        $this->post_type = $post_type;
		$this->attributes = $this->parse_attributes( $attributes );
		$this->query_args = $this->parse_query_args();
	}

	/**
	 * Get post_type
	 *
	 * @return array
	 */
	public function get_post_type() {
		return $this->post_type;
	}

	/**
	 * Get shortcode attributes.
	 *
	 * @return array
	 */
	public function get_attributes() {
		return $this->attributes;
	}

	/**
	 * Get query args.
	 *
	 * @return array
	 */
	public function get_query_args() {
		return $this->query_args;
	}

	/**
	 * Get shortcode content.
	 *
	 * @return string
	 */
	public function get_content(array $datas = []) {
		return $this->object_loop($datas);
	}

	/**
	 * Get first ID of loop
	 *
	 * @return int
	 */
	public function get_first_item() {
		$object = $this->get_query_results();
		if ( $object && !empty($object->ids) ) {
			return $object->ids[0];
		}
		return false;
	}

	/**
	 * Get All IDs of loop
	 *
	 * @return bool|array
	 */
	public function get_ids() {
		$object = $this->get_query_results();
		if ( $object && !empty($object->ids) ) {
			return $object->ids;
		}
		return false;
	}

	/**
	 * Parse attributes.
	 *
	 * @param  array $attributes Shortcode attributes.
	 * @return array
	 */
	protected function parse_attributes( $attributes ) {
        // $attributes = $this->parse_legacy_attributes( $attributes );
        
		$attributes = wp_parse_args(
            $attributes,
            array(
				'limit'          => '-1',      // Results limit.
				'columns'        => '',        // Number of columns.
				'rows'           => '',        // Number of rows. If defined, limit will be ignored.
				'orderby'        => '',        // menu_order, title, date, rand, price, popularity, rating, or id.
				'order'          => '',        // ASC or DESC.
				'attribute'      => '',        // Single attribute slug.
				'class'          => '',        // HTML class.
				'page'           => 1,         // Page for pagination.
				'paginate'       => false,     // Should results be paginated.
				'cache'          => true,      // Should shortcode output be cached.
			),
		);

		if ( ! absint( $attributes['columns'] ) ) {
			$attributes['columns'] = 4;
		}

		return $attributes;
	}

	/**
	 * Parse query args.
	 *
	 * @return array
	 */
	protected function parse_query_args() {
		$query_args = array(
			'post_type'           => $this->post_type,
			'post_status'         => 'publish',
			'ignore_sticky_posts' => true,
			'orderby'             => $this->attributes['orderby'],
        );

		$orderby_value         = explode( '-', $query_args['orderby'] );
		$orderby               = esc_attr( $orderby_value[0] );
		$order                 = ! empty( $orderby_value[1] ) ? $orderby_value[1] : strtoupper( $this->attributes['order'] );
		$query_args['orderby'] = $orderby;
		$query_args['order']   = $order;

		if (isset($this->attributes['post__not_in']) && !empty($this->attributes['post__not_in'])) {
			$query_args['post__not_in'] = $this->attributes['post__not_in'];
		}

		if ( antra_string_to_bool( $this->attributes['paginate'] ) ) {
			$this->attributes['page'] = absint( empty( $_GET['antra-page'] ) ? 1 : $_GET['antra-page'] ); // phpcs:ignore WordPress.Security.NonceVerification.Recommended
		}

		if ( ! empty( $this->attributes['rows'] ) ) {
			$this->attributes['limit'] = $this->attributes['columns'] * $this->attributes['rows'];
		}

		$query_args['posts_per_page'] = intval( $this->attributes['limit'] );
		if ( 1 < $this->attributes['page'] ) {
			$query_args['paged'] = absint( $this->attributes['page'] );
		}
		$query_args['tax_query']  = array(); // phpcs:ignore WordPress.DB.SlowDBQuery.slow_db_query_tax_query

		if (!empty( $this->attributes['category']) && !empty( $this->attributes['taxonomy'])) {
			$this->set_categories_query_args( $query_args );
		}
		if (!empty($this->attributes['taxs_query'])) {
			$this->set_terms_query_args($query_args);
		}

		// IDs.
		$this->set_ids_query_args( $query_args );

		// Always query only IDs.
		$query_args['fields'] = 'ids';

		return apply_filters('antra_query_args_param_list_object', $query_args);
	}

	/**
	 * Set categories query args.
	 *
	 * @since 1.0.12
	 * @param array $query_args Query args.
	 */
	protected function set_terms_query_args( &$query_args ) {

		if ( empty( $this->attributes['taxs_query']['terms_query'] ) ) {
			return;
		}
		$taxs_query = $this->attributes['taxs_query'];
		
		$tax_query = array();
		$tax_query['relation'] = $taxs_query['relation'] ?? 'AND';

		foreach ( $taxs_query['terms_query'] as $taxonomy => $data ) {

			if ( empty( $data['terms'] ) ) {
				continue;
			}

			$terms = array_map( 'trim', explode( ',', $data['terms'] ) );

			$tax_query[] = array(
				'taxonomy' => $taxonomy,
				'field'    => 'slug',
				'terms'    => $terms,
				'operator' => $data['operator'] ?? 'IN',
			);
		}

		if ( count( $tax_query ) > 1 ) {
			$query_args['tax_query'] = $tax_query;
		}
	}

	/**
	 * Set categories query args.
	 *
	 * @since 1.0.0
	 * @param array $query_args Query args.
	 */
	protected function set_categories_query_args( &$query_args ) {
		$taxonomy = $this->attributes['taxonomy'];
		if ( taxonomy_exists($taxonomy) ) {
			$categories = array_map( 'sanitize_title', explode( ',', $this->attributes['category'] ) );
			$field      = 'slug';

			if ( is_numeric( $categories[0] ) ) {
				$field      = 'term_id';
				$categories = array_map( 'absint', $categories );
				// Check numeric slugs.
				foreach ( $categories as $cat ) {
					$the_cat = get_term_by( 'slug', $cat, $taxonomy );
					if ( false !== $the_cat ) {
						$categories[] = $the_cat->term_id;
					}
				}
			}

			$query_args['tax_query'][] = array(
				'taxonomy'         => $taxonomy,
				'terms'            => $categories,
				'field'            => $field,
				'operator'         => $this->attributes['cat_operator'],

				/*
				 * When cat_operator is AND, the children categories should be excluded,
				 * as only products belonging to all the children categories would be selected.
				 */
				'include_children' => 'AND' === $this->attributes['cat_operator'] ? false : true,
			);
		}
	}

	/**
	 * Set ids query args.
	 *
	 * @since 1.0.0
	 * @param array $query_args Query args.
	 */
	protected function set_ids_query_args( &$query_args ) {
		if ( ! empty( $this->attributes['ids'] ) ) {
			$ids = array_map( 'trim', explode( ',', $this->attributes['ids'] ) );

			if ( 1 === count( $ids ) ) {
				$query_args['p'] = $ids[0];
			} else {
				$query_args['post__in'] = $ids;
			}
		}
	}

    /**
	 * Get wrapper classes.
	 *
	 * @param  int $columns Number of columns.
	 * @return array
	 */
	protected function get_wrapper_classes( $columns ) {
		$classes = array( 'antra-'.$this->post_type );

        $classes[] = 'columns-' . $columns;

		$classes[] = $this->attributes['class'];

		return $classes;
	}

    /**
	 * Run the query and return an array of data, including queried ids and pagination information.
	 *
	 * @return object Object with the following props; ids, per_page, found_posts, max_num_pages, current_page
	 */
	protected function get_query_results() {
		
			$query = new WP_Query( $this->query_args );

			$paginated = ! $query->get( 'no_found_rows' );

			$results = (object) array(
				'ids'          => wp_parse_id_list( $query->posts ),
				'total'        => $paginated ? (int) $query->found_posts : count( $query->posts ),
				'total_pages'  => $paginated ? (int) $query->max_num_pages : 1,
				'per_page'     => (int) $query->get( 'posts_per_page' ),
				'current_page' => $paginated ? (int) max( 1, $query->get( 'paged', 1 ) ) : 1,
			);

		/**
		 * Filter shortcode object query results.
		 *
		 * @param stdClass $results Query results.
		 */
		return apply_filters( 'antra_shortcode_object_query_results', $results, $this );
	}

	/**
	 * Loop over found object.
	 *
	 * @return string
	 */
	protected function object_loop(array $datas = []) {
		$columns  = absint( $this->attributes['columns'] );
		$classes  = $this->get_wrapper_classes( $columns );
		$object = $this->get_query_results();
        $post_type = $this->post_type;

		ob_start();

		if ( $object && $object->ids ) {
			// Prime caches to reduce future queries.
			if ( is_callable( '_prime_post_caches' ) ) {
				_prime_post_caches( $object->ids );
			}

			// Setup the loop.
            $setup_args = [
                'columns'      => $columns,
                'is_shortcode' => true,
                'is_search'    => false,
                'is_paginated' => antra_string_to_bool( $this->attributes['paginate'] ),
                'total'        => $object->total,
                'total_pages'  => $object->total_pages,
                'per_page'     => $object->per_page,
                'current_page' => $object->current_page,
				'image_size' => $this->attributes['image_size'] ?? 'large',
                'style' => '1'
            ];

			if (isset($this->attributes['wrap_container'])) {
				$setup_args['wrap_container'] = antra_string_to_bool( $this->attributes['wrap_container'] );
			}
			if (isset($this->attributes['active_first'])) {
				$setup_args['active_first'] = antra_string_to_bool( $this->attributes['active_first'] );
			}
            if (isset($this->attributes['enable_carousel'])) {
                $setup_args['enable_carousel'] = antra_string_to_bool( $this->attributes['enable_carousel'] );
            }
            if (isset($this->attributes['style'])) {
                $setup_args['style'] = $this->attributes['style'];
            }
            if (isset($this->attributes['paginate_type'])) {
                $setup_args['paginate_type'] = $this->attributes['paginate_type'];
            }
            if (isset($this->attributes['show_index'])) {
                $setup_args['show_index'] = $this->attributes['show_index'];
            }

			if ($post_type === 'service') {
				if (isset($this->attributes['show_icon'])) {
					$setup_args['show_icon'] = $this->attributes['show_icon'];
				}
				if (isset($this->attributes['show_exerpt'])) {
					$setup_args['show_exerpt'] = $this->attributes['show_exerpt'];
				}
                if (isset($this->attributes['image_text_service'])) {
                    $setup_args['image_text_service'] = $this->attributes['image_text_service'];
                }
			}

			if ($post_type === 'project') {
				$setup_args['button_text'] = $this->attributes['button_text'];
			}

			antra_setup_object_loop($setup_args);

			antra_set_object_loop_prop('post_type', $post_type);

			$original_post = $GLOBALS['post'];

			antra_object_loop_start();

			$this->get_template_loop($object, $setup_args, $datas);

			$GLOBALS['post'] = $original_post; // phpcs:ignore WordPress.WP.GlobalVariablesOverride.Prohibited

			antra_object_loop_end();

			if ( antra_string_to_bool( $this->attributes['paginate'] ) ) {
				$paginate_type = antra_get_object_loop_prop( 'paginate_type', 'pagination');

				$args = array(
					'total'   => antra_get_object_loop_prop( 'total_pages' ),
					'current' => antra_get_object_loop_prop( 'current_page' ),
					'base'    => esc_url_raw( add_query_arg( 'antra-page', '%#%', false ) ),
					'format'  => '?antra-page=%#%',
					'paginate_type' => $paginate_type
				);

				if ($paginate_type == 'loadmore') {
					get_template_part( 'template-parts/loop/loadmore', '', $args);
				} else {
					get_template_part( 'template-parts/loop/pagination', '', $args);
				}
			}

			if (isset($this->attributes['enable_carousel']) && $this->attributes['enable_carousel'] === 'yes') {
                antra_set_object_loop_prop('enable_carousel', false);
                if (isset($this->attributes['carousel_settings']) && $this->attributes['carousel_settings'] != '') {
                    echo wp_kses_post($this->attributes['carousel_settings']);
                }
            }

			wp_reset_postdata();
			antra_object_reset_loop();
		} else {
			echo esc_attr(apply_filters('antra_object_nodata_found', __('No data was founded', 'antra')));
		}

		return '<div class="' . esc_attr( implode( ' ', $classes ) ) . '">' . ob_get_clean() . '</div>';
	}

	private function get_template_loop($object, $setup_args, array $datas = []) {
		$post_type = $this->post_type;
		$style = antra_get_object_loop_prop('style', 1);
		$active_first = antra_get_object_loop_prop('active_first', false);

		$classes_item = ['antra-item', $post_type];
		if (antra_get_object_loop_prop('enable_carousel', false) == true) {
			$classes_item[] = 'swiper-slide';
		}
		if ($style) {
			$classes_item[] = $post_type.'-style-'.$style;
		}

		$image_size = antra_get_object_loop_prop('image_size');
		if ( antra_get_object_loop_prop( 'total' ) ) {
			foreach ( $object->ids as $index => $object_id ) {
				$GLOBALS['post'] = get_post( $object_id ); // phpcs:ignore WordPress.WP.GlobalVariablesOverride.Prohibited
				setup_postdata( $GLOBALS['post'] );
				
				$classes = $classes_item;
				if (isset($datas['classes'][$object_id])) {
					$classes[] = $datas['classes'][$object_id];
				}
				if ($active_first && $index === 0) {
					$classes[] = 'actived';
				}

				$item_args = [
					'class' => implode(' ', $classes),
					'index' => $index + 1,
					'image_size' => $image_size,
				];

				if ($post_type == 'service') {
					$item_args['icon'] = $datas['icons'][$object_id] ?? '';
					if (!empty($datas['numbers'][$object_id])) {
						$item_args['index'] = $datas['numbers'][$object_id];
					}
				}

				if (isset($datas['attributes'][$object_id])) {
					$item_args['attributes'] = $datas['attributes'][$object_id];
				}

				// Render object template.
				get_template_part( 'template-parts/'.$post_type.'/block/style', apply_filters('antra_post_type_block_style', $setup_args['style'], $post_type, $item_args), $item_args);

			}
		}
	}

}
