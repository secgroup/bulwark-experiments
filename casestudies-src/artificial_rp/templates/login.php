<div class='text-center mt-5'>
    <form class="form-signin" method="post" action="/login">
        <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
        <label for="inputUser" class="sr-only">Username</label>
        <input type="email" id="inputUser" name="username" class="form-control group" placeholder="Email" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control group" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
        <p>or <a href="/register">sign up</a></p>

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
        
    </form>
</div>
</div>
