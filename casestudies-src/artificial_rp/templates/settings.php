<div class='text-center mt-5 form-signin'>
    <h1 class="h3 mb-3 font-weight-normal">Settings</h1>
    <div class="mt-5">
    <?php
    foreach ($this->buttons as $button) {
    ?>
        <div class="p-2">
            <?php echo $button; ?>
        </div>
    <?php
    }
    ?>
    </div>
</div>
