package org.ser.marvel.heroes

import androidx.core.graphics.toColorInt
import org.ser.marvel.R
import org.ser.marvel.heroes.model.Hero

class HeroesDataset {

    fun getHeroes(): List<Hero> = listOf(
        Hero(1, "Rocket raccoon", R.drawable.rocket, "#39b4bc".toColorInt()),
        Hero(2, "Gnom Gnomich", R.drawable.gnom, "#5c3a77".toColorInt()),
        Hero(3, "Spider", R.drawable.spider, "#edc93f".toColorInt()),
        Hero(4, "Vision", R.drawable.vision, "#65d6da".toColorInt()),
        Hero(5, "DareDevil", R.drawable.daredevil, "#3575a1".toColorInt()),
    )

}