# Flutter


https://github.com/Rohinsri/AlippoAssignment/assets/61387189/99f51989-f2ab-4da5-adac-da7e7bb441b1




# How to build the App?
1. Clone the GitHub Repository
2. Create a new Flutter Project in your local
3. Copy the 'lib' folder of the project and replace the 'lib folder of the New Flutter Project with the 'lib' folder of the repository.
4. Do the same for the pubspec.yaml file
5. Run the app in chrome, edge, windows or android emulator

#
### Assignment:

1. Create a page that has two tabs “Products” and “Carts” respectively. Given below are the details for each tab:
    1. Product
        1. User this API: https://dummyjson.com/products
        2. Build a page where it contains a list of cards that have the following information from the API response.
            1. Title
            2. Description
            3. Price
            4. Discounted Price
            5. And thumbnail.
            6. On tapping any of these items, it should redirect to the details page which contains complete information about the product.
    2. Carts
        1. Use this API: https://dummyjson.com/carts
        2. Build a page where it contains a list of cards that have the following information from the API response.
        3. Total products
        4. id
        5. total
        6. And userId
        7. On tap any of these items, it should redirect to the details page which it contains complete information about the cart.
2. While integrating this API write the logic of pagination as such it can be used in the case of both tab pages Product and Carts.
3. Do not use any external library while writing pagination logic.
4. You can use your preferred network client library. (http/dio etc..)
5. No restriction on choosing a state-management library (exclude: GET_X).
6. Use Json Serializable package while defining response models.

### Bonus feature:

1. To mark a product as a favorite and list them separately on a page as well as on the page where we show all products. 
2. To implement functionality one can use the `sqf_lite` plugin. 

### Deliverables:

1. Create a Git repository to store your project code.
2. Ensure the code is well-structured, clean, and follows best practices.
3. Provide clear instructions on how to build and run the app.
4. Attach a small working demo of your app in the format of a gif under `readme.MD` file at your GitHub repository.


