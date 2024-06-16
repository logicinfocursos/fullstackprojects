<?php

function breadcrumb($currentPage = null, $previusPage = null, $previusPageLink = null)
{ ?>
    <?php if ($currentPage) : ?>
        <nav aria-label=" breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">home</a></li>

                <?php if ($previusPage) : ?>
                    <li class="breadcrumb-item"><a href="<?= $previusPageLink ?>"><?= $previusPage ?></a></li>
                <?php endif; ?>


                <li class="breadcrumb-item active" aria-current="page"><?= $currentPage ?></li>

            </ol>
        </nav>
    <?php endif; ?>
<?php }
