<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Integrator</title>

    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/style.css" rel="stylesheet">
  </head>

  <body>

      <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
          <h5 class="my-0 mr-md-auto font-weight-normal">
              <span class="fa fa-handshake-o"></span>
              <a class="titlelink" href="/">Integrator</a>
          </h5>
          <?php if ($_SESSION['loggedin'] === true) { ?>
              <a class="btn btn-outline-secondary mr-2"><span class="fa fa-user"></span> <span><?php echo $_SESSION['username']; ?></span></a>
              <a class="btn btn-outline-primary mr-2" href="/settings"><span class="fa fa-cog"></span> Settings</a>
              <a class="btn btn-outline-primary" href="/logout"><span class="fa fa-sign-out"></span> Log out</a>
          <?php } else { ?>
              <nav class="my-2 my-md-0 mr-md-3">
                  <a class="p-2 text-dark" href="/login">Log in</a>
              </nav>
              <a class="btn btn-outline-primary" href="/register">Sign up</a>
          <?php } ?>
      </div>   

      <div class="container">
          <?php $this->yieldView(); ?>
      </div>

      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script>
      <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script>
  </body>
</html>
