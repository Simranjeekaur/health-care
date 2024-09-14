import 'package:flutter/material.dart';

class HealthyEatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Eating',style:TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Healthy Eating',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Introduction to Healthy Eating',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Healthy eating is about consuming a balanced diet that provides all the essential nutrients your body needs to function correctly. This includes a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Key Principles of Healthy Eating',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              _buildKeyPrincipleItem(
                context,
                '1. Eat a Variety of Foods',
                'Include different types of foods in your diet to ensure you get a wide range of nutrients.',
              ),
              _buildKeyPrincipleItem(
                context,
                '2. Incorporate Plenty of Fruits and Vegetables',
                'Aim to fill half your plate with fruits and vegetables at each meal. They are rich in vitamins, minerals, and fiber.',
              ),
              _buildKeyPrincipleItem(
                context,
                '3. Choose Whole Grains',
                'Whole grains like brown rice, quinoa, and whole wheat bread are more nutritious than refined grains.',
              ),
              _buildKeyPrincipleItem(
                context,
                '4. Include Lean Proteins',
                'Opt for lean proteins such as chicken, fish, beans, and legumes. These help in muscle building and repair.',
              ),
              _buildKeyPrincipleItem(
                context,
                '5. Limit Added Sugars and Salt',
                'Reduce the intake of foods high in added sugars and salt. Check food labels for hidden sugars and sodium.',
              ),
              _buildKeyPrincipleItem(
                context,
                '6. Stay Hydrated',
                'Drink plenty of water throughout the day. Limit sugary drinks and choose water or herbal teas instead.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Healthy Eating Tips',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              _buildTipItem(
                context,
                'Tip 1',
                'Plan your meals ahead of time to ensure you have all the ingredients you need for healthy meals.',
              ),
              _buildTipItem(
                context,
                'Tip 2',
                'Cook at home more often to have control over the ingredients and portion sizes.',
              ),
              _buildTipItem(
                context,
                'Tip 3',
                'Read nutrition labels to make informed choices about the foods you eat.',
              ),
              _buildTipItem(
                context,
                'Tip 4',
                'Keep healthy snacks like fruits, nuts, and yogurt on hand to avoid reaching for unhealthy options.',
              ),
              _buildTipItem(
                context,
                'Tip 5',
                'Practice mindful eating by paying attention to hunger and fullness cues and avoiding distractions while eating.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Recipes for Healthy Eating',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              _buildRecipeItem(
                context,
                'Healthy Smoothie Bowl',
                'Ingredients:\n- 1 banana\n- 1 cup spinach\n- 1/2 cup Greek yogurt\n- 1/2 cup almond milk\n- 1 tablespoon chia seeds\n- 1/2 cup mixed berries\n\nInstructions:\n1. Blend all ingredients until smooth.\n2. Pour into a bowl and top with additional fruits, nuts, and seeds.',
              ),
              _buildRecipeItem(
                context,
                'Quinoa Salad',
                'Ingredients:\n- 1 cup cooked quinoa\n- 1/2 cup cherry tomatoes, halved\n- 1/2 cucumber, diced\n- 1/4 cup feta cheese, crumbled\n- 2 tablespoons olive oil\n- 1 tablespoon lemon juice\n- Salt and pepper to taste\n\nInstructions:\n1. Combine all ingredients in a large bowl.\n2. Toss with olive oil and lemon juice. Season with salt and pepper.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyPrincipleItem(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.teal),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeItem(BuildContext context, String title, String recipe) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            recipe,
            style: TextStyle(
              fontSize: 16.0,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
