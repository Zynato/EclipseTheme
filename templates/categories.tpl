
<div class="categories row" itemscope itemtype="http://www.schema.org/ItemList">
    <div class="<!-- IF widgets.sidebar.length -->col-lg-10 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
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

        <div class="row categories-header hidden-xs hidden-sm">
            <div class="col-md-8 col-xs-12"><div class="header-title"></div></div>
            <div class="col-md-1"><div class="header-title"></div></div>
            <div class="col-md-3"><div class="header-title"></div></div>
        </div>
        <!-- BEGIN categories -->
        <!-- IF categories.isSection -->
        <div component="categories/category" data-cid="{categories.cid}">
            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <div class="category-section-info">
                        <div class="category-section-info-content">
                            <span class="category-title">{categories.name}</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 hidden-xs hidden-sm"></div>
                <div class="col-md-3 hidden-xs hidden-sm"></div>
            </div>
            <div class="row categories-section-footer">
                <div class="col-md-8 col-xs-12"><div class="footer-title"></div></div>
                <div class="col-md-1"><div class="footer-title"></div></div>
                <div class="col-md-3"><div class="footer-title"></div></div>
            </div>
        </div>
        <!-- ELSE -->
        <div component="categories/category" data-cid="{categories.cid}" data-numRecentReplies="1">
            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <div class="category-info">
                        <div class="category-info-content">
                            <div class="category-icon">
                                <i class="fa fa-fw {categories.icon}"></i>
                            </div>
                            <!-- IMPORT partials/categories/link.tpl -->

                            <div class="category-description">
                                {categories.descriptionParsed}
                            </div>
                        </div>

                        <!-- IF !config.hideSubCategories -->
                        <div class="subcategories">
                            <!-- BEGIN categories.children -->
                            <div class="subcategory">
                                <i class="fa fa-fw {categories.children.icon} subcategory-icon"></i>
                                <!-- IF categories.children.link -->
                                <a class="subcategory-title" href="{categories.children.link}" title="{categories.children.name}">{categories.children.name}</a>
                                <!-- ELSE -->
                                <a class="subcategory-title" href="{config.relative_path}/category/{categories.children.slug}" title="{categories.children.name}">{categories.children.name}</a>
                                <!-- ENDIF categories.children.link -->
                            </div>
                            <!-- END categories.children -->
                        </div>
                        <!-- ENDIF !config.hideSubCategories -->
                    </div>
                </div>
                <div class="col-md-1 hidden-xs hidden-sm">
                    <div class="total-post-count" title="{categories.totalPostCount}">
                        {categories.totalPostCount} [[global:posts]]
                    </div>
                </div>
                <div class="col-md-3 hidden-xs hidden-sm">
                    <div class="teaser" component="topic/teaser">
                        <!-- BEGIN posts -->
                        <!-- IF @first -->
                        <div component="category/posts">
                            <a href="{config.relative_path}/user/{../user.userslug}">
                                <!-- IF ../user.picture -->
                                <img class="user-avatar" title="{../user.username}" alt="{../user.username}" src="{../user.picture}" />
                                <!-- ELSE -->
                                <div class="user-icon" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</div>
                                <!-- ENDIF ../user.picture -->
                            </a>

                            <a href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">{../topic.title}</a>
                            <a class="permalink" href="{config.relative_path}/user/{../user.userslug}">
                                {../user.username}
                                <small class="timeago" title="{../timestampISO}"></small>
                            </a>
                        </div>
                        <!-- ENDIF @first -->
                        <!-- END posts -->

                        <!-- IF !../posts.length -->
                        [[category:no_new_posts]]
                        <!-- ENDIF !../posts.length -->
                    </div>
                </div>
            </div>
        </div>
        <!-- ENDIF categories.isSection -->
        <!-- END categories -->
    </div> 
    <div widget-area="sidebar" class="col-lg-2 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		<!-- BEGIN widgets.sidebar -->
		{{widgets.sidebar.html}}
		<!-- END widgets.sidebar -->
    </div>
</div>