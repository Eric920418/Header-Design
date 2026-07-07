<div class="post-style-3">
    <div class="post-inner">
        <?php antra_post_thumbnail('antra-post-grid', true, true); ?>
        <div class="post-content">
            <div class="entry-content">
                <div class="entry-meta-top">
                    <?php antra_post_meta(['show_cat' => false, 'show_author' => true, 'show_date' => true, 'show_comment' => false]); ?>
                </div>
                <?php the_title('<h3 class="entry-title"><a href="' . esc_url(get_permalink()) . '" rel="bookmark">', '</a></h3>'); ?>
                <div class="excerpt-content"><?php echo wp_trim_words(get_the_excerpt(), 30); ?></div>
            </div>
        </div>
    </div>
</div>
