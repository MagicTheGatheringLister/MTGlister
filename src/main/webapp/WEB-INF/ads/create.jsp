<style>
    <jsp:include page="/WEB-INF/ads/index.css"/>
</style>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="deck_name">Title</label>
                <input id="deck_name" name="deck_name" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" name="date" id="date">
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
