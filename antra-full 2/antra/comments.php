<?php
/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */
if (post_password_required()) {
    return;
}
?>

<section id="comments" class="comments-area" aria-label="<?php esc_attr_e('Leave A Comment', 'antra'); ?>">
    <?php
    if (have_comments()) :
        ?>
        <div class="comment-list-wrap">
            <h2 class="comments-title">
                <?php
                printf( // WPCS: XSS OK.
                /* translators: 1: number of comments, 2: post title */
                    esc_html( _nx( 'Customer Reviews', 'Customer Reviews', get_comments_number(), 'comments title', 'antra' ) ),
                    number_format_i18n( get_comments_number() ),
                    '<span>' . get_the_title() . '</span>'
                );
                ?>
            </h2>

            <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : // Are there comments to navigate through. ?>
                <nav id="comment-nav-above" class="comment-navigation" role="navigation" aria-label="<?php esc_attr_e('Comment Navigation Above', 'antra'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('Comment navigation', 'antra'); ?></span>
                    <div class="nav-previous"><?php previous_comments_link(esc_html__('&larr; Older Comments', 'antra')); ?></div>
                    <div class="nav-next"><?php next_comments_link(esc_html__('Newer Comments &rarr;', 'antra')); ?></div>
                </nav><!-- #comment-nav-above -->
            <?php endif; // Check for comment navigation.
            ?>

            <ol class="comment-list">
                <?php
                wp_list_comments(
                    array(
                        'style'      => 'ol',
                        'short_ping' => true,
                        'callback'   => 'antra_comment',
                    )
                );
                ?>
            </ol><!-- .comment-list -->

            <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : // Are there comments to navigate through. ?>
                <nav id="comment-nav-below" class="comment-navigation" role="navigation" aria-label="<?php esc_attr_e('Comment Navigation Below', 'antra'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('Comment navigation', 'antra'); ?></span>
                    <div class="nav-previous"><?php previous_comments_link(esc_html__('&larr; Older Comments', 'antra')); ?></div>
                    <div class="nav-next"><?php next_comments_link(esc_html__('Newer Comments &rarr;', 'antra')); ?></div>
                </nav><!-- #comment-nav-below -->
            <?php endif; // Check for comment navigation.
            ?>
        </div>
    <?php

    endif;

    if (!comments_open() && 0 !== intval(get_comments_number()) && post_type_supports(get_post_type(), 'comments')) :
        ?>
        <p class="no-comments"><?php esc_html_e('Comments are closed.', 'antra'); ?></p>
    <?php
    endif;
    $args = apply_filters(
        'antra_comment_form_args', array(
            'title_reply_before' => '<span id="reply-title" class="gamma comment-reply-title">',
            'title_reply_after'  => '</span>',
            'comment_field'      => '<p class="comment-form-comment"><textarea id="comment" name="comment" cols="45" rows="3" maxlength="65525" required="required" placeholder="' . esc_attr__('Message Here..', 'antra') . '"></textarea></p>',
        )
    );
    comment_form($args);

    ?>

</section><!-- #comments -->

