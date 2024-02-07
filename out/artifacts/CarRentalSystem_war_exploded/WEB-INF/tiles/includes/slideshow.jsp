<%--SlideShow--%>

<div class="container my-5">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-bs-interval="1500">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/assets/imgs/mercedes_five.jpg" class="d-block w-100 myslideimage" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Mercedes-Benz GLA</h5>
                    <p>Mercedes-Benz GLA is a subcompact luxury crossover SUV manufactured by Mercedes</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/assets/imgs/mercedes_two.jpg" class="d-block w-100 myslideimage" alt="..." myslideimage>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Mercedes-Benz GLB</h5>
                    <p>Mercedes-Benz GLB is a compact luxury crossover SUV produced by Mercedes.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/assets/imgs/tesla_four.jpg" class="d-block w-100 myslideimage" alt="..." myslideimage>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Tesla Model S</h5>
                    <p>Tesla Model S is a battery-powered liftback car serving as the flagship model of Tesla</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev btn btn-ligh" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next btn btn-ligh" type="button" data-target="#carouselExampleCaptions" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </button>
    </div>
</div>