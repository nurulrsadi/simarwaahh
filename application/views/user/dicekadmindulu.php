</header>

<!-- modal for information at header -->

<!-- Content -->
<section>
	<header class="main">

	</header>
  <?php if( $user['statususer'] ==3 ):?>
	<div class="features">

		<article>
			<!-- <span class="icon fa-gem"></span> -->
			<div class="content">
				<img src="<?php echo base_url('assets/img/default/cekfile.png')?>" class="img-fluid" alt="Responsive image"
					width="100%">
			</div>
		</article>
		<article>
			<div class="content">
				<p class="customtextcheckdana">Persyaratan untuk mencairkan dana anda sedang kami cek,
					<br>silahkan
					tunggu verifikasi agar dapat ke gedung aljamiah untuk melakukan pencairan.</p>
			</div>
		</article>
	</div>
<?php else: ?>
<?php endif;?>

</section>
</div>
</div>
