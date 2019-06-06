<!-- IMPORT partials/breadcrumbs.tpl -->

<div class="row">
    <div class="col-md-12">
        <div widget-area="heading">
            <!-- BEGIN widgets.heading -->
            {{widgets.heading.html}}
            <!-- END widgets.heading -->
        </div>
    </div>
</div>

<div class="row categories" itemscope itemtype="http://www.schema.org/ItemList">
    <div class="<!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length --> clearfix">
        <div class="row">
            <div class="col-md-12">
                <div class="motd">
                    <div widget-area="motd">
                        <!-- BEGIN widgets.motd -->
                        {{widgets.motd.html}}
                        <!-- END widgets.motd -->
                    </div>
                </div>
            </div>
        </div>

		<div class="row">
			<!-- BEGIN categories -->
			<div component="categories/category" class="col-md-4 col-sm-6 col-xs-12 category-root" data-cid="{categories.cid}" data-numRecentReplies="{categories.numRecentReplies}">
				<meta itemprop="name" content="{categories.name}">

				<!-- IF categories.link -->
				<a style="color: {categories.color};" href="{categories.link}" itemprop="url" target="_blank">
				<!-- ELSE -->
				<a style="color: {categories.color};" href="{config.relative_path}/category/{categories.slug}" itemprop="url">
				<!-- ENDIF categories.link -->
					<div
						id="category-{categories.cid}" class="category-header category-header-image-{categories.imageClass}"
						title="{categories.description}"
						style="
							<!-- IF categories.backgroundImage -->background-image: url({categories.backgroundImage});<!-- ENDIF categories.backgroundImage -->
							<!-- IF categories.bgColor -->background-color: {categories.bgColor};<!-- ENDIF categories.bgColor -->
						"
					>
						<div id="category-{categories.cid}" class="category-slider-{categories.numRecentReplies}">
							<!-- IF categories.icon -->
							<div class="category-box"><i class="fa {categories.icon} fa-4x"></i></div>
							<!-- ENDIF categories.icon -->
						</div>
					</div>
				</a>

                <div class="category-box">
                    <div class="category-details">
                        <div class="category-info well well-sm">
                            <ul class="list-group">
                                <li class="list-group-item category-description category-details-block">
                                    <h4 class="category-title">
                                        <!-- IF categories.link -->
                                        <a href="{categories.link}" itemprop="url" target="_blank">
                                        <!-- ELSE -->
                                        <a href="{config.relative_path}/category/{categories.slug}" itemprop="url" title="{categories.name}">
                                        <!-- ENDIF categories.link -->
                                        {categories.name}
                                        </a>
                                    </h4>

                                    <p>{categories.descriptionParsed}</p>
                                </li>
                                <!-- IF categories.posts -->
                                <li class="list-group-item category-details-block">
                                    <h4>Recent Posts</h4>
                                    <!-- BEGIN posts -->
                                    <div component="category/posts">
                                        <div class="post-preview">
                                            <!-- IF categories.posts.user.picture -->
                                            <p>
                                                <img src="{categories.posts.user.picture}" class="pull-left category-profile-pic" />
                                                <a href="{config.relative_path}/user/{categories.posts.user.userslug}"><strong>{categories.posts.user.username}</strong></a><br />
                                            </p>                                                
                                            <!-- ELSE -->
                                            <div class="user-icon profile-image user-img not-responsive category-profile-pic" style="background-color: {categories.posts.user.icon:bgColor};">{categories.posts.user.icon:text}</div> 
                                            <a href="{config.relative_path}/user/{categories.posts.user.userslug}"><strong>{categories.posts.user.username}</strong></a><br />
                                            <!-- ENDIF categories.posts.user.picture -->
                                            
                                            <a href="{config.relative_path}/topic/{categories.posts.topic.slug}">{categories.posts.topic.title}</a>
                                            <p class="timeago text-muted" title="{categories.posts.timestampISO}"></p>
                                        </div>
                                    </div>
                                    <!-- END posts -->
                                </li>
                                <!-- ENDIF categories.posts -->
                            </ul>
                        </div>
                    </div>
                </div>  
			</div>
			<!-- END categories -->
		</div>
	</div>

	<div widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		<!-- BEGIN widgets.sidebar -->
		{{widgets.sidebar.html}}
		<!-- END widgets.sidebar -->
	</div>
</div>